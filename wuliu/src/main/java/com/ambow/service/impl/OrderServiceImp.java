package com.ambow.service.impl;

import com.ambow.dao.OrderDao;
import com.ambow.entity.Customer;
import com.ambow.entity.Driver;
import com.ambow.entity.Order;
import com.ambow.entity.Tran;
import com.ambow.service.OrderService;
import com.ambow.utils.ODDGenerator;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

/**
 * @ClassName OrderServiceImp
 * Author 王弈程
 * @Date 2021/9/3 14:07
 **/
@Service
@Transactional
public class OrderServiceImp implements OrderService {

    @Resource
    private OrderDao orderDao;

    @Override
    public List<Order> adminFindAllOrder(int currentPage, int pageSize, int order_state, String order_no, String customer_name, String driver_name,String tran_name) {
        PageHelper.startPage(currentPage,pageSize);
        return orderDao.adminFindAllOrder(order_state,order_no,customer_name,driver_name,tran_name);
    }

    @Override
    public int customerAddOrder(Order order) {
        //order.setOrder_no(ODDGenerator.getOrderNo());
        order.setOrder_state(0);
        order.setOrder_create_date(new Date());
        /* 测试 */
        /*Customer customer = new Customer();
        customer.setCustomer_id(2);
        order.setOrder_customer(customer);*/
        /*order.setOrder_customer(order.getOrder_customer());*/
        return orderDao.customerAddOrder(order);
    }

    @Override
    public List<Order> adminFindOrderFlagIs0(int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        return orderDao.adminFindOrderFlagIs0();
    }

    @Override
    public Order adminFindOrderContent(int order_id) {
        return orderDao.adminFindOrderContent(order_id);
    }

    @Override
    public List<Driver> findDriverFlagIs0() {
        return orderDao.findDriverFlagIs0();
    }

    @Override
    public List<Tran> findTranFlagIs1() {
        return orderDao.findTranFlagIs1();
    }

    @Override
    public int driverFlagChangeIs1(int driver_id) {
        return orderDao.driverFlagChangeIs1(driver_id);
    }

    @Override
    public int tranFlagChangeIs0(int tran_id) {
        return orderDao.tranFlagChangeIs0(tran_id);
    }

    @Override
    public int adminUpdateOrder(Order order) {
        int i = orderDao.adminUpdateOrder(order);
        if (i>0){
            /* 修改司机、车、订单的状态 */

            /*Driver driver = new Driver();
            driver.setDriver_id(1);
            int i1 =orderDao.driverFlagChangeIs1(driver.getDriver_id());*/
            int i1 = orderDao.driverFlagChangeIs1(order.getOrder_driver().getDriver_id());
            System.out.println("i1:" + i1);

            /*Tran tran = new Tran();
            tran.setTran_id(1);
            int i2 = orderDao.tranFlagChangeIs0(tran.getTran_id());*/
            int i2 = orderDao.tranFlagChangeIs0(order.getOrder_tran().getTran_id());
            System.out.println("i2:" + i2);

            /*order.setOrder_id(8);*/
            int i3 = orderDao.orderFlagChangeIs1(order.getOrder_id());
            System.out.println("i3:" + i3);
        }
        return i;
    }

    @Override
    public int orderFlagChangeIs1(int order_id) {
        return orderDao.orderFlagChangeIs1(order_id);
    }

    @Override
    public int delOrderById(int order_id) {
        return orderDao.delOrderById(order_id);
    }

    @Override
    public int customerUpdateOrder(Order order) {
        return orderDao.customerUpdateOrder(order);
    }
}
