package org.activiti.rest.diagram.services;

/**
 * Created by 杨欣 on 2018/5/19.
 */
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/service")
public class ProcessDefinitionDiagramLayoutResource extends BaseProcessDefinitionDiagramLayoutResource {
    public ProcessDefinitionDiagramLayoutResource() {
    }

    @RequestMapping(
            value = {"/process-definition/{processDefinitionId}/diagram-layout"},
            method = {RequestMethod.GET},
            produces = {"application/json"}
    )
    public ObjectNode getDiagram(@PathVariable String processDefinitionId) {
        return this.getDiagramNode((String)null, processDefinitionId);
    }
}
