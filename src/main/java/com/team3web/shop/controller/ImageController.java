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
      
      String fullPath = imageDirectory + "/" + imageUrl ;
      System.out.println(fullPath);
      return new UrlResource("file:" + fullPath);
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
//   @RequestMapping(value= "/productItem/{filename}" ,method = RequestMethod.GET)
//      @ResponseBody
//      public ResponseEntity<Resource> productItem(@PathVariable("filename") String filename) throws Exception{
//         
//         String imageDirectory  = "D:/program/imgUpload";
//         String imagePath = imageDirectory+filename;
//                 // 이미지 파일을 읽어 Resource로 변환
//                 Path path = Paths.get(imagePath);
//                 byte[] imageBytes = Files.readAllBytes(path);
//                 ByteArrayResource resource = new ByteArrayResource(imageBytes);
//
//                 // 이미지 파일의 MIME 타입 설정
//                 HttpHeaders headers = new HttpHeaders();
//                 headers.setContentType(MediaType.IMAGE_PNG); // 이미지 타입에 따라 설정
//
//                 // ResponseEntity를 사용하여 이미지 Resource와 헤더를 클라이언트로 반환
//                 return ResponseEntity.ok()
//                         .headers(headers)
//                         .body(resource);
//             }

}