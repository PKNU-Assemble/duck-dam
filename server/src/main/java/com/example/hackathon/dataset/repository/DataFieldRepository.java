package com.example.hackathon.dataset.repository;

import com.example.hackathon.dataset.domain.DataField;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataFieldRepository extends JpaRepository<DataField, Long> {
}
