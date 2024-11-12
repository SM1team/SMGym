package edu.sm.app.service;

import edu.sm.app.dto.ProductDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService implements SMService<Integer, ProductDto> {

    final ProductRepository productRepository;

    @Override
    public void add(ProductDto productDto) throws Exception {
        productRepository.insert(productDto);
    }

    @Override
    public void modify(ProductDto productDto) throws Exception {
        productRepository.update(productDto);
    }

    @Override
    public void del(Integer s) throws Exception {
        productRepository.delete(s);
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








