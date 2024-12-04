package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.ProductDto;
import edu.sm.app.dto.Search;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.ProductRepository;
import edu.sm.app.repository.TrainerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService implements SMService<Integer, ProductDto> {
    private final ProductRepository productRepository;

//    @Value("${app.dir.uploadimgdir}")
//    String imgdir;
//
    @Override
    public void add(ProductDto productDto) throws Exception {
        productRepository.insert(productDto);
    }

    @Override
    public void modify(ProductDto productDto) throws Exception {
        productRepository.update(productDto);
    }

    @Override
    public void del(Integer integer) throws Exception {
        productRepository.delete(integer);
    }

    @Override
    public ProductDto get(Integer s) throws Exception {
        return productRepository.selectOne(s);
    }

    @Override
    public List<ProductDto> get() throws Exception {
        return productRepository.select();
    }
}
