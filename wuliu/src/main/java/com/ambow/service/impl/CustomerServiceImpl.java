package com.ambow.service.impl;

import com.ambow.dao.CustomerDao;
import com.ambow.entity.Customer;
import com.ambow.entity.Order;
import com.ambow.service.CustomerService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerDao customerDao;

    @Override
    public Customer checkLogin(String customer_username, String customer_password) {
        return customerDao.checkLogin(customer_username, customer_password);
    }

    @Override
    public List<Customer> findCustomerList(int currentPage, int pageSize, String customer_name, String customer_college, String customer_no) {
        // 启动分页
        PageHelper.startPage(currentPage, pageSize);
        // 返回所有查询到的信息
        return customerDao.findCustomerList(customer_name,customer_college,customer_no);
    }

    @Override
    public int saveCustomer(Customer customer) {
        return customerDao.saveCustomer(customer);
    }


    @Override
    public Customer findCustomerById(Integer customer_id) {
        return customerDao.findCustomerById(customer_id);
    }

    @Override
    public int updateCustomer(Customer customer) {
        return customerDao.updateCustomer(customer);
    }


    public List<Order> findCustomerOwnOrder(int currentPage, int pageSize, Integer customer_id) {
        // 启动分页
        PageHelper.startPage(currentPage, pageSize);
        return customerDao.findCustomerOwnOrder(customer_id);
    }

    @Override
    public Customer checkCustomer(String customer_username) {
        return customerDao.checkCustomer(customer_username);
    }

}
