package com.example.hackathon.dataset.repository;

import com.example.hackathon.dataset.domain.DataField;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DataFieldRepository extends JpaRepository<DataField, Long> {
    @Query("SELECT df FROM DataField df ORDER BY RAND()")
    List<DataField> findDataFieldRandom(Pageable pageable);
    @Query("SELECT df FROM DataField df WHERE df.genre LIKE %:genre% ORDER BY RAND()")
    List<DataField> findDataFieldByGenre(@Param("genre")String genre , Pageable pageable);

    @Query("SELECT df FROM DataField df WHERE df.titleName LIKE %:keyword% AND df.mediaType=:searchType")
    Page<DataField> findByKewordAndSearch(@Param("keyword")String keyword, @Param("searchType")String searchType , Pageable pageable);
    Optional<DataField> findById(Long contentId);
}
