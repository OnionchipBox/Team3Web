package com.team3web.shop.controller;

import java.net.MalformedURLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team3web.shop.service.ProductService;
import com.team3web.shop.vo.ProductVO;

@RestController
public class ImageController {
   
   @Autowired
   private ProductService productService;
   
   @RequestMapping("/images/{productId}")
   public UrlResource imageUpload(@PathVariable("productId") int productId) throws MalformedURLException {
      String imageDirectory  = "D:/program/imgUpload";
      
      ProductVO product = productService.findById(productId);
      String imageUrl = product.getImageUrl();
      
      String fullPath = imageDirectory + "/" + imageUrl +".png";
      System.out.println(fullPath);
      return new UrlResource("file:" + fullPath);
   }
}