package com.team3web.shop.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import com.team3web.shop.service.ReviewService;
import com.team3web.shop.vo.PageVO;
import com.team3web.shop.vo.ProductVO;
import com.team3web.shop.vo.ReviewVO;

// 제품 관련 컨트롤러
@Controller
public class ProductController {
    
	
	//11/03 리뷰 서비스 의존성 추가 
	@Autowired
	private ReviewService reviewser;
	
	
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
      public String productItem(@RequestParam("productId") int productId, Model model,HttpServletRequest request,PageVO p) {
          // productId를 사용하여 제품 정보를 데이터베이스에서 가져오는 코드
          // 가져온 정보를 모델에 추가하여 JSP 파일로 전달
          ProductVO product = productService.findById(productId);
          model.addAttribute("product", product);
          
          
        int page=1;
  		int limit=10; //한 페이지에 보여지는 목록 개수를 10개로 함
  		if(request.getParameter("page")!=null) {
  			page=Integer.parseInt(request.getParameter("page"));
  		}

  		/* 검색과 관련된 부분 추가 */
  		String find_name = request.getParameter("find_name"); //검색어
  		String find_field = request.getParameter("find_field"); //검색 필드
  		p.setFind_name("%"+find_name+"%");  //%는 SQL문에서 하나 이상의 임의의 모르는 문자와 매핑 대응
  		p.setFind_field(find_field);

  		int totalCount = this.reviewser.getRowCount(p); 
  		System.out.println("레코드 개수 : "+totalCount);
  		// 검색전 총 레코드 개수 , + 검색 후 레코드 개수

  		p.setStartrow((page-1)*10+1); //시작행 번호
  		p.setEndrow(p.getStartrow()+limit-1); //끝행 번호

  		List<ReviewVO> rlist=this.reviewser.getReviewList(p); //검색전 목록
  		System.out.println("목록 개수 : "+rlist.size());

  		for(ReviewVO r:rlist) {
  			//System.out.println("번호:"+r.getRe_no());
  			//System.out.println("작성자:"+r.getRe_name());
  		}
  		//총 페이지수
  		int maxpage=(int)((double)totalCount/limit+0.95);
  		//시작페이지(1,11,21 ..)
  		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
  		int endpage=maxpage;
  		if(endpage>startpage+10-1) endpage=startpage+10-1;
          
        
  	   // 이 부분에서 Model 객체를 사용하여 데이터를 전달
  	    model.addAttribute("rlist", rlist);
  	    model.addAttribute("page", page);
  	    model.addAttribute("startpage", startpage);
  	    model.addAttribute("endpage", endpage);
  	    model.addAttribute("maxpage", maxpage);
  	    model.addAttribute("listcount", totalCount);
  	    model.addAttribute("find_field", find_field);
  	    model.addAttribute("find_name", find_name);

          
          
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