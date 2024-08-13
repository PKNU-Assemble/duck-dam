package com.example.hackathon.dataset.repository;

import com.example.hackathon.dataset.domain.Data;
import com.example.hackathon.dataset.domain.DataFieldUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface  DataRepository extends JpaRepository<Data, Long> {
    @Query("SELECT d FROM Data d WHERE d.titleName=:title ORDER BY RAND() limit 1")
    Optional<Data> findByTitle(@Param("title")String title);
}
