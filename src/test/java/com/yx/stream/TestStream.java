package com.yx.stream;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import com.yx.sys.entity.Menu;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
/**
 * 
 * @author 杨欣
 * 2018-03-04
 *
 */
public class TestStream {

    private static List<Dish> menu;
    private static List<Menu> menus = new ArrayList<Menu>();

    @BeforeClass
    public static void init() {
        Menu m1 = new Menu();
        m1.setId("1");
        m1.setSort(1);
        m1.setName("菜单1");
        Menu m4 = new Menu();
        m4.setId("4");
        m4.setSort(4);
        m4.setName("菜单4");
        Menu m2 = new Menu();
        m2.setId("2");
        m2.setSort(2);
        m2.setName("菜单2");
        Menu m3 = new Menu();
        m3.setId("3");
        m3.setSort(3);
        m3.setName("菜单3");

        menus.add(m1);
        menus.add(m4);
        menus.add(m2);
        menus.add(m3);
        menu = Arrays.asList(new Dish("pork", false, 800, Dish.Type.MEAT),
                new Dish("beef", false, 700, Dish.Type.MEAT), new Dish(
                        "chicken", false, 400, Dish.Type.MEAT), new Dish(
                        "french fires", true, 530, Dish.Type.OTHER), new Dish(
                        "rice", true, 350, Dish.Type.OTHER), new Dish(
                        "season fruit", true, 120, Dish.Type.OTHER), new Dish(
                        "pizza", true, 550, Dish.Type.OTHER), new Dish(
                        "prawns", false, 300, Dish.Type.FISH), new Dish(
                        "salmon", false, 450, Dish.Type.FISH));
    }

    @Test
    public void testFunOfStream() {
        Assert.assertNotNull(menu);
        Assert.assertEquals(9, menu.size());
        List<Dish> l1 = menu.stream().filter(d -> d.getCalories() > 400)
                .collect(Collectors.toList());
        Assert.assertEquals(5, l1.size());
        Assert.assertEquals("[pork, beef, french fires, pizza, salmon]",
                l1.toString());
        List<String> l2 = menu.stream().map(Dish::getName)
                .collect(Collectors.toList());
        Assert.assertEquals("[pork, beef, chicken, french fires, rice, season fruit, pizza, prawns, salmon]",
                l2.toString());
    }
    @Test
    public void testDistinct(){
        List<Integer> numbers = Arrays.asList(1,2,3,1,2,3,4,2,3,4,6);
        numbers.stream().filter(i -> i%2 == 0).distinct().forEach(System.out::println);
    }
    @Test
    public void testReduce(){
        List<Integer> numbers = Arrays.asList(1,2,3,4,5);
        int sum = numbers.stream().reduce(0,(a,b) -> a+b);
        Assert.assertEquals(15, sum);
    }
    @Test
    public void testSorted(){

        System.out.print("排序前:");
        menus.forEach(System.out::println);

        System.out.print("排序后:");
        menus.stream().sorted(Comparator.comparing(Menu::getSort)).forEach(System.out::println);
    }
    @Test
    public void testMap(){
        menus.stream().map(m -> {
            m.setDescription("map操作");
                    return m;
        }).forEach(System.out::println);
    }
}
