package org.activiti.modeler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.activiti.engine.ActivitiException;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 杨欣 on 2018/5/10.
 */
@RestController
@RequestMapping("/service")
public class ModelEditorJsonRestResource {
    protected static final Logger LOGGER = LoggerFactory.getLogger(ModelEditorJsonRestResource.class);
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private ObjectMapper objectMapper;

    public ModelEditorJsonRestResource() {
    }


    @RequestMapping(
            value = {"/model/{modelId}/json"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    public ObjectNode getEditorJson(@PathVariable String modelId) {
        ObjectNode modelNode = null;
        Model model = this.repositoryService.getModel(modelId);
        if(model != null) {
            try {
                if(StringUtils.isNotEmpty(model.getMetaInfo())) {
                    modelNode = (ObjectNode)this.objectMapper.readTree(model.getMetaInfo());
                } else {
                    modelNode = this.objectMapper.createObjectNode();
                    modelNode.put("name", model.getName());
                }

                modelNode.put("modelId", model.getId());
                ObjectNode e = (ObjectNode)this.objectMapper.readTree(new String(this.repositoryService.getModelEditorSource(model.getId()), "utf-8"));
                modelNode.put("model", e);
            } catch (Exception var5) {
                LOGGER.error("Error creating model JSON", var5);
                throw new ActivitiException("Error creating model JSON", var5);
            }
        }

        return modelNode;
    }
}
