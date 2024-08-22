package com.abc.service;

import java.util.List;
import com.abc.dao.ServiceDAO;
import com.abc.model.Service;

public class ServiceService {

    private static ServiceService instance;
    private ServiceDAO serviceDAO;

    private ServiceService() {
        this.serviceDAO = new ServiceDAO();
    }

    public static ServiceService getInstance() {
        if (instance == null) {
            synchronized (ServiceService.class) {
                if (instance == null) {
                    instance = new ServiceService();
                }
            }
        }
        return instance;
    }

    public void addService(Service service) {
        serviceDAO.addService(service);
    }

    public List<Service> getAllServices() {
        return serviceDAO.getAllServices();
    }

    public void updateService(Service service) {
        serviceDAO.updateService(service);
    }

    public void deleteService(int serviceId) {
        serviceDAO.deleteService(serviceId);
    }
}
