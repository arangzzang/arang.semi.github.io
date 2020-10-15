package com.en.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.en.product.model.service.ProductService;
import com.en.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ProductUpdateServelt
 */
@WebServlet("/admin/productUpdate")
public class ProductUpdateServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 보낸 요청이 multipart으로 요청을 한건지 확인하기
				if(!ServletFileUpload.isMultipartContent(request)){
					request.setAttribute("msg", "상품등록 오류! [form:enctype에러!]");
					request.setAttribute("loc", "/");
					request.getRequestDispatcher("view/common/msg.jsp").forward(request, response);
					return;
				}
				
				//정상적인 multipart 방식으로 요청이 오면 파일을 업로드하고 DB에 저장하기!
				//cos.jar를 이용해서 파일을 업로드한다.
				//1. 파일 업로드 위치를 선정! 절대경로로...
				String path=getServletContext().getRealPath("/upload/product");
				//2. 업로드파일의 최대크기를 설정
				int maxSize=1024*1024*50; //10MB
				//3. 파일명에 대한 인코딩값을 설정
				String encode="UTF-8";
				//4. 파일명을 재정의할 수 있는 객체(메소드) 대입
				//cos.jar에서 기본제공하는 파일명 rename객체가 있음.
				DefaultFileRenamePolicy rename=new DefaultFileRenamePolicy();
				
				//cos.jar에서 제공하는 MultipartRequest객체를 생성하면 업로드가 됨!
				MultipartRequest mr=new MultipartRequest(request,path,maxSize,encode,rename);
				
				//MultipartRequest객체를 생성 후에는 파라미터 값을 MultipartRequest로 가져와야함.
				//HttpServletRequest는 사용하지않음
				Product p = new Product();
				p.setProductNo(Integer.parseInt(mr.getParameter("pNo")));
				
				p.setProductName(mr.getParameter("pName"));
				p.setProductPrice(Integer.parseInt(mr.getParameter("price")));
				p.setProductContent(mr.getParameter("content"));
				p.setProductType(mr.getParameter("type"));
				
				//파일이름은 rename되어있는 파일이름을 가져와야하기 때문에
				//mr.getFileSystemNmae("name")메소드를 이용
				String filePath= "/upload/product/";
				/*p.setProductThumbnail(mr.getFilesystemName("th")!=null?filePath+mr.getFilesystemName("th"):filePath+mr.getParameter("t"));*/
				p.setProductThumbnail(filePath+mr.getFilesystemName("th"));
				//System.out.println("이거"+mr.getFilesystemName("th")!=null?filePath+mr.getFilesystemName("th"):filePath+mr.getParameter("t"));
				p.setProductSubimg(filePath+mr.getFilesystemName("sub"));
				p.setProductImg1(filePath+mr.getFilesystemName("img1"));
				p.setProductImg2(filePath+mr.getFilesystemName("img2"));
				p.setProductImg3(filePath+mr.getFilesystemName("img3"));
				p.setProductImg4(filePath+mr.getFilesystemName("img4"));
				p.setProductImg5(filePath+mr.getFilesystemName("img5"));
				p.setProductImg6(filePath+mr.getFilesystemName("img6"));
				
				if(mr.getFilesystemName("th")==null){
					p.setProductThumbnail(mr.getParameter("t"));
				}
				if(mr.getFilesystemName("sub")==null){
					p.setProductSubimg(mr.getParameter("s"));
				}
				if(mr.getFilesystemName("img1")==null){
					p.setProductImg1(mr.getParameter("i1"));
				}
				if(mr.getFilesystemName("img2")==null){
					p.setProductImg2(mr.getParameter("i2"));
				}
				if(mr.getFilesystemName("img3")==null){
					p.setProductImg3(mr.getParameter("i3"));
				}
				if(mr.getFilesystemName("img4")==null){
					p.setProductImg4(mr.getParameter("i4"));
				}
				if(mr.getFilesystemName("img5")==null){
					p.setProductImg5(mr.getParameter("i5"));
				}
				if(mr.getFilesystemName("img6")==null){
					p.setProductImg6(mr.getParameter("i6"));
					
				}
				
				System.out.println(p.getProductThumbnail());
				System.out.println(p.getProductSubimg());
				System.out.println(p.getProductImg1());
				System.out.println(p.getProductImg2());
				System.out.println(p.getProductImg3());
				System.out.println(p.getProductImg4());
				int result=new ProductService().updateProduct(p);
				
				String msg = "";
				String loc = "";
				if (result > 0) {
					msg = "성공적으로 수정되었습니다.";
					loc = "/view/admin/productList.jsp";
				} else {
					msg = "수정에 실패하였습니다.";
					loc = "/view/admin/productList.jsp";
				}
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
