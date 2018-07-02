package com.yx.activiti;

import org.activiti.engine.*;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.IdentityLink;
import org.activiti.engine.task.Task;
import org.activiti.engine.test.ActivitiRule;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by 杨欣 on 2018/4/20.
 */
public class Activiti {
    private static ApplicationContext context;
    private static String filePath="activiti/leave.bpmn";
    private static ProcessEngine processEngine;
    private static RepositoryService repositoryService;
    private static RuntimeService runtimeService;
    private static IdentityService identityService;
    @Before
    public void init(){
        context = new ClassPathXmlApplicationContext(new String[] {"appcontext.xml"});
        processEngine = (ProcessEngine)context.getBean("processEngine");
        repositoryService = (RepositoryService)context.getBean("repositoryService");
        runtimeService = (RuntimeService)context.getBean("runtimeService");
        identityService = processEngine.getIdentityService();
    }
    /**
     * 测试请假流程
     */
    @Test
    public void deployFlow() throws Exception{
        Assert.assertNotNull(context);
        Assert.assertNotNull(processEngine);
        DeploymentBuilder deploymentBuilder = repositoryService.createDeployment();
        deploymentBuilder.addClasspathResource(filePath).deploy();
    }
    @Test
    public void queryProcdef(){
        ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();
        ProcessDefinition pd = query.singleResult();
        Assert.assertNotNull(pd.getKey());
    }
    @Test
    public void startFlow(){

        RuntimeService runtimeService = processEngine.getRuntimeService();
        /**
         * 启动请假单流程  并获取流程实例
         * 因为该请假单流程可以会启动多个所以每启动一个请假单流程都会在数据库中插入一条新版本的流程数据
         * 通过key启动的流程就是当前key下最新版本的流程
         *
         */

        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("leave");
        processEngine.getTaskService(). setAssignee(processInstance.getId(),"admin");
        List<IdentityLink> l = processEngine.getTaskService().getIdentityLinksForTask("admin");
        l.stream().forEach(System.out::print);
        System.out.println("id:"+processInstance.getId()+",activitiId:"+processInstance.getActivityId()+"definetionId:"+
                processInstance.getProcessDefinitionId());
    }
    @Test
    public void findMytask(){
        String user = "amdin";
        List<Task>taskList= processEngine.getTaskService()//获取任务service
                .createTaskQuery()//创建查询对象
                .processDefinitionId("leave")
                .list();
        System.out.print("任务数量"+taskList.size());
        if(taskList.size() > 0){
            for (Task task : taskList){
                System.out.println("代办任务ID:"+task.getId());
                System.out.println("代办任务name:"+task.getName());
                System.out.println("代办任务创建时间:"+task.getCreateTime());
                System.out.println("代办任务办理人:"+task.getAssignee());
                System.out.println("流程实例ID:"+task.getProcessInstanceId());
                System.out.println("执行对象ID:"+task.getExecutionId());

            }
        }
    }
    @Test
    public void IdenttifyServiceTest(){
        User user = identityService.newUser("admin");
        user.setFirstName("yx");
        user.setLastName("mxzenf");
        user.setEmail("mxzenf@gmail.com");
        identityService.saveUser(user);
        User userInDb = identityService.createUserQuery().userId("admin").singleResult();
        Assert.assertNotNull(userInDb);
//        identityService.deleteUser("admin");
//        userInDb = identityService.createUserQuery().userId("admin").singleResult();
//        Assert.assertNull(userInDb);
    }
    @Test
    public void testGroup(){
        Group group = identityService.newGroup("admin");
        group.setName("管理员");
        group.setType("assignment");
        identityService.saveGroup(group);
        List<Group> l1 = identityService.createGroupQuery().groupId("admin").list();
        Assert.assertEquals(1, l1.size());
        identityService.deleteGroup("admin");
        l1 = identityService.createGroupQuery().groupId("admin").list();
        Assert.assertEquals(0, l1.size());
    }
}
