package com.team3web.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team3web.shop.service.CartService;
import com.team3web.shop.service.CategoryService;
import com.team3web.shop.service.ProductService;
import com.team3web.shop.vo.CartVO;
import com.team3web.shop.vo.ProductVO;

// 제품 관련 컨트롤러
@Controller
public class ProductController {
   private List<ProductVO> products;
   private List<CartVO> cartItems;

   public void CombinedData(List<ProductVO> products, List<CartVO> cartItems) {
      this.products = products;
      this.cartItems = cartItems;
   }

   @Autowired
   private CartService cartService; // CartService는 장바구니 관련 서비스 클래스

   @Autowired
   ProductService productService;

   @Autowired
   private CategoryService categoryService;
   
   private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

   // 남성 카테고리
   @RequestMapping(value = "/mens", method = RequestMethod.GET)

   public String getMens() throws Exception {
      logger.info("get mens()");
      return "/category/men/mens";
   }

   // 셔츠
   @RequestMapping(value = "/mens/shirts", method = RequestMethod.GET)
   public String getShirts(Model model) throws Exception {
      List<ProductVO> shirts = productService.getProductsByCategoryId(3); // 3은 셔츠 카테고리의 categoryId
      model.addAttribute("shirts", shirts);

      System.out.println("shirts:" + shirts);
      return "/category/men/shirts";

   }

   // 바지
   @RequestMapping(value = "/mens/pants", method = RequestMethod.GET)
   public String getPants() throws Exception {
      logger.info("get pants");

      return "/category/men/pants";
   }

   @RequestMapping(value = "/womens", method = RequestMethod.GET)
   public String getWomens() throws Exception {
      logger.info("get women");
      return "/category/women/womens";
   }

   @RequestMapping(value = "/womens/dresses", method = RequestMethod.GET)
   public String getDress() throws Exception {
      logger.info("get dress");
      return "/category/women/dresses";
   }

   @RequestMapping(value = "/womens/skirts", method = RequestMethod.GET)
   public String getSkirts() throws Exception {
      logger.info("get skirts");
      return "/category/women/skirts";
   }

   @RequestMapping(value = "/accessory", method = RequestMethod.GET)
   public String getAccessory(Model model) throws Exception {

      int categoryID1 = 2; // '악세서리' 카테고리의 categoryId
      int categoryID2 = 4; // '가방' 카테고리의 categoryId

      List<ProductVO> watches = productService.getProductsByCategoryId(categoryID1);
      List<ProductVO> bags = productService.getProductsByCategoryId(categoryID2);

// 두 리스트 병합
      List<ProductVO> accessory = Stream.concat(watches.stream(), bags.stream()).collect(Collectors.toList());

      model.addAttribute("accessory", accessory);

      System.out.println("accessory: " + accessory);
      return "/category/accessory/accessorys";
   }

   @RequestMapping(value = "/accessory/watches", method = RequestMethod.GET)
   public String getWatches(Model model) throws Exception {
      List<ProductVO> wathes=productService.getProductsByCategoryId(2);
      
      model.addAttribute("wathes",wathes);
      System.out.println("watch"+wathes);
      
      
      return "/category/accessory/Watches";
   }
   @RequestMapping(value = "/accessory/bag", method = RequestMethod.GET)
   public String getBag() throws Exception {
      logger.info("get bag");
      return "/category/accessory/bag";
   }
   @RequestMapping(value = "/addProductForm", method = RequestMethod.GET)
   public String addProductForm(Model model) throws Exception {

      
        // 데이터베이스에서 제품 정보를 조회
       List<ProductVO> products = productService.getAllProudct();

       // 제품 정보를 JSP 파일로 전달
       model.addAttribute("products", products);
      return "/addProductForm";

   }

   @RequestMapping(value = "/product", method = RequestMethod.GET)
   public String product() throws Exception {
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

   // 제품등록
   @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
   public String addProduct(@ModelAttribute ProductVO product, @RequestParam("uploadFile") MultipartFile file,@RequestParam("subCategory") int subCategory,
         Model model) throws IOException {
      // 파일 저장 경로 설정 : 실제 서비스되는 위치(프로젝트 외부에 저장)
      String savedFileName = "";
      String externalUploadPath = "D:\\program\\imgUpload\\";

      // 2. 원본 파일 이름 알아오기
      String originalFileName = file.getOriginalFilename();
      // 3. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
      UUID uuid = UUID.randomUUID();
      savedFileName = uuid.toString() + ".png";

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

   @ResponseBody
   @RequestMapping(value = "/search", method = RequestMethod.GET)
   public List<ProductVO> selectList(String keyword) throws Exception {
      if (keyword == "") {
         List<ProductVO> list = new ArrayList<>();
         return list;
      }
      return productService.selectItemsByKeyword(keyword);
   }

} 