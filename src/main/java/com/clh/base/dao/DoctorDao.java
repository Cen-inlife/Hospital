package com.clh.base.dao;

import com.clh.base.entity.Doctor;
import com.clh.base.entity.DoctorSearch;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DoctorDao {
    void insDoctor(Doctor doctor);

    Doctor login(@Param("username") String username, @Param("password") String password);

    Doctor getDoctorById(Integer doctor_id);

    void updateDoctor(Doctor doctor);

    Doctor getDoctorByUserName(String username);

    List<Doctor> getAllDoctorList(DoctorSearch search);

    void deleteDoctorById(int doctor_id);

    List<Doctor> getDoctorByDepartId(Integer depart_id);
}
