package com.example.hackathon.dataset.repository;

import com.example.hackathon.dataset.domain.Data;
import org.springframework.data.jpa.repository.JpaRepository;

public interface  DataRepository extends JpaRepository<Data, Long> {
}
