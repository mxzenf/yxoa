package org.activiti.modeler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.activiti.engine.ActivitiException;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Model;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.PNGTranscoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

/**
 * Created by 杨欣 on 2018/5/10.
 */
@RestController
@RequestMapping("/service")
public class ModelSaveRestResource {
    protected static final Logger LOGGER = LoggerFactory.getLogger(ModelSaveRestResource.class);
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private ObjectMapper objectMapper;

    public ModelSaveRestResource() {
    }

    @RequestMapping(
            value = {"/model/{modelId}/save"},
            method = {RequestMethod.PUT}
    )
    @ResponseStatus(HttpStatus.OK)
    public void saveModel(@PathVariable String modelId, @RequestBody MultiValueMap<String, String> values) {
        try {
            Model e = this.repositoryService.getModel(modelId);
            ObjectNode modelJson = (ObjectNode)this.objectMapper.readTree(e.getMetaInfo());
            modelJson.put("name", (String)values.getFirst("name"));
            modelJson.put("description", (String)values.getFirst("description"));
            e.setMetaInfo(modelJson.toString());
            e.setName((String)values.getFirst("name"));
            this.repositoryService.saveModel(e);
            this.repositoryService.addModelEditorSource(e.getId(), ((String)values.getFirst("json_xml")).getBytes("utf-8"));
            ByteArrayInputStream svgStream = new ByteArrayInputStream(((String)values.getFirst("svg_xml")).getBytes("utf-8"));
            TranscoderInput input = new TranscoderInput(svgStream);
            PNGTranscoder transcoder = new PNGTranscoder();
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            TranscoderOutput output = new TranscoderOutput(outStream);
            transcoder.transcode(input, output);
            byte[] result = outStream.toByteArray();
            this.repositoryService.addModelEditorSourceExtra(e.getId(), result);
            outStream.close();
        } catch (Exception var11) {
            LOGGER.error("Error saving model", var11);
            throw new ActivitiException("Error saving model", var11);
        }
    }
}
