package com.yx.sys.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.yx.sys.comm.Constant;
import com.yx.sys.persistence.OaDaoSupport;
import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.ActivitiException;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * Created by 杨欣 on 2018/5/1.
 */
@Service("modelService")
public class ModelService {
    @Resource(name = "dao")
    private OaDaoSupport dao;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private ProcessEngine processEngine;
    public String createModel(String name, String key) throws UnsupportedEncodingException {
        ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode editorNode = objectMapper.createObjectNode();
        editorNode.put("id", "canvas");
        editorNode.put("resourceId", "canvas");
        ObjectNode stencilSetNode = objectMapper.createObjectNode();
        stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
        editorNode.put("stencilset", stencilSetNode);
        Model modelData = repositoryService.newModel();

        ObjectNode modelObjectNode = objectMapper.createObjectNode();
        modelObjectNode.put(ModelDataJsonConstants.MODEL_NAME, name);
        modelObjectNode.put(ModelDataJsonConstants.MODEL_REVISION, 1);
        String description = StringUtils.defaultString("模型描述信息");
        modelObjectNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);
        modelData.setMetaInfo(modelObjectNode.toString());
        modelData.setName(name);
        modelData.setKey(StringUtils.defaultString(key));

        repositoryService.saveModel(modelData);
        repositoryService.addModelEditorSource(modelData.getId(), editorNode.toString().getBytes("utf-8"));
        return modelData.getId();
    }
    public List<com.yx.sys.entity.Model> getAllModel(Map<String, Object> param){
        return (List<com.yx.sys.entity.Model>)dao.queryList("sys.getModels", param);
    }
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor=Exception.class)
    public String deploy(String id) {
        String message = Constant.SUCCESS;
        try {
            ProcessEngine pe = processEngine;
            RepositoryService repositoryService = pe.getRepositoryService();
            org.activiti.engine.repository.Model modelData = repositoryService.getModel(id);
            BpmnJsonConverter jsonConverter = new BpmnJsonConverter();
            JsonNode editorNode = new ObjectMapper().readTree(repositoryService.getModelEditorSource(modelData.getId()));
            BpmnModel bpmnModel = jsonConverter.convertToBpmnModel(editorNode);
            BpmnXMLConverter xmlConverter = new BpmnXMLConverter();
            byte[] bpmnBytes = xmlConverter.convertToXML(bpmnModel,"ISO-8859-1");

            String processName = modelData.getName();
            if (!StringUtils.endsWith(processName, ".bpmn20.xml")){
                processName += ".bpmn20.xml";
            }
//			System.out.println("========="+processName+"============"+modelData.getName());
            ByteArrayInputStream in = new ByteArrayInputStream(bpmnBytes);
            Deployment deployment = repositoryService.createDeployment().name(modelData.getName())
                    .addInputStream(processName, in).deploy();
//					.addString(processName, new String(bpmnBytes)).deploy();

            // 设置流程分类
            List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().deploymentId(deployment.getId()).list();
            for (ProcessDefinition processDefinition : list) {
                repositoryService.setProcessDefinitionCategory(processDefinition.getId(), modelData.getCategory());
                message = "部署成功";
            }
            if (list.size() == 0){
                message = "部署失败，没有流程。";
            }
        } catch (Exception e) {
            throw new ActivitiException("设计模型图不正确，检查模型正确性", e);
        }
        return message;
    }
    public void delete(String ids){
        processEngine.getRepositoryService().deleteModel(ids);
    }
    public List<Map<String, Object>> getFlows(Map param){
        return (List<Map<String, Object>> )dao.queryList("sys.getFlows",param);
    }
}
