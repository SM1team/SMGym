package edu.sm.app.repository;


import edu.sm.app.dto.ProductDto;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface ProductRepository extends SMRepository<Integer, ProductDto> {

   }
