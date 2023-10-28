package com.team3web.shop.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team3web.shop.service.ProductService;
import com.team3web.shop.vo.ProductVO;

// 제품 관련 컨트롤러
@Controller
public class ProductController {
    
   @Autowired
   ProductService productService;
      private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
      
    //남성 카테고리
      @RequestMapping(value = "/mens", method = RequestMethod.GET)
   
    
       public String getMens() throws Exception {
           logger.info("get mens()");
       return "/category/men/mens";    
      }
      //셔츠
      @RequestMapping(value = "/mens/shirts" ,method = RequestMethod.GET)
      public String getShirts() throws Exception{
         logger.info("get shirts");
         return "/category/men/shirts";
         
      }
      //바지
      @RequestMapping(value ="/mens/pants", method = RequestMethod.GET)
      public String getPants() throws Exception{
         logger.info("get pants");
         
         return "/category/men/pants";
      }
      
      @RequestMapping(value = "/womens", method = RequestMethod.GET)
      public String getWomens() throws Exception{
         logger.info("get women");
         return "/category/women/womens";
      }
      
      @RequestMapping(value = "/womens/dresses", method = RequestMethod.GET)
      public String getDress() throws Exception{
         logger.info("get dress");
         return "/category/women/dresses";
      }
      
      @RequestMapping(value = "/womens/skirts", method = RequestMethod.GET)
      public String getSkirts() throws Exception{
         logger.info("get skirts");
         return "/category/women/skirts";
      }
      
      @RequestMapping (value ="/addProductForm" , method = RequestMethod.GET)
      public String addProductForm() throws Exception{
         
         return "/addProductForm";
         
      }
      
      @RequestMapping(value= "/product" ,method = RequestMethod.GET)
      public String product() throws Exception{
         return "/product";
         
      }
      @RequestMapping(value = "/productItem", method = RequestMethod.GET)
      public String productItem(@RequestParam("productId") int productId, Model model) {
          // productId를 사용하여 제품 정보를 데이터베이스에서 가져오는 코드
          // 가져온 정보를 모델에 추가하여 JSP 파일로 전달
          ProductVO product = productService.findById(productId);
          model.addAttribute("product", product);
          
          return "/productItem";
      }
//      @RequestMapping(value= "/productItem" ,method = RequestMethod.GET)
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

         
      
      
   
      
      @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
      public String addProduct(@ModelAttribute ProductVO product, @RequestParam("uploadFile") MultipartFile file, Model model) throws IOException {
          // 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
          String savedFileName = "";
          String externalUploadPath = "D:\\program\\imgUpload\\";

          // 2. 원본 파일 이름 알아오기
          String originalFileName = file.getOriginalFilename();
          // 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
          UUID uuid = UUID.randomUUID();
          savedFileName = uuid.toString()+".png";

          // 5. 외부 저장소에 파일 생성 및 저장
          File externalFile = new File(externalUploadPath + savedFileName);
          file.transferTo(externalFile);

   

          product.setImageUrl(savedFileName);
          product.setThumbimg(originalFileName);
          productService.addProduct(product);
          model.addAttribute("originalFileName", originalFileName);
          logger.info("addProduct()" + product);
          model.addAttribute("product", product);
          return "redirect:/"; // 상품 목록 페이지로 리다이렉트
}

}