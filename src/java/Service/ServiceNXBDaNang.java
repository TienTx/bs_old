/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import NXBDaNang.Order;
import NXBDaNang.ServiceSach;
import NXBDaNang.ServiceSachService;
import java.util.ArrayList;

/**
 *
 * @author taphuong
 */
public class ServiceNXBDaNang {
    private  ServiceSachService service;
    private ServiceSach nhaCungCap;

    public ServiceNXBDaNang() {
        service=new ServiceSachService();
        nhaCungCap=service.getServiceSachPort();
    }
    
    public ArrayList sachCungCap(){ 
        return (ArrayList) nhaCungCap.sachCungCap();
    }
    public String datHang(Order order){
        return nhaCungCap.datHang(order);
    }
}
