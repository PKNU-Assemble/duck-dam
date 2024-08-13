package com.example.hackathon.dataset.repository;

import com.example.hackathon.dataset.domain.DataField;
import com.example.hackathon.dataset.domain.DataFieldUser;
import com.example.hackathon.user.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DataFieldUserRepository extends JpaRepository<DataFieldUser, Long> {
    @Query("SELECT dfu FROM DataFieldUser dfu WHERE dfu.user.id=:userId ORDER BY RAND() limit 1")
    Optional<DataFieldUser> findByUserId(@Param("userId")Long userId);

    @Query("SELECT dfu FROM DataFieldUser dfu WHERE dfu.user.id=:userId")
    List<DataFieldUser> findListByUserId(@Param("userId")Long userId);

    Optional<DataFieldUser>findByUserAndDataField(User user, DataField dataField);
}
