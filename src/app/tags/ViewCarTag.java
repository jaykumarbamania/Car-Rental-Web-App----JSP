package app.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ViewCarTag extends SimpleTagSupport {
	
	private String imgPath;
	private String carname;
	private String carmodel;
	private double rentprice;
	
	public String getImgPath() {
		return imgPath;
	}



	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}



	public String getCarname() {
		return carname;
	}



	public void setCarname(String carname) {
		this.carname = carname;
	}



	public String getCarmodel() {
		return carmodel;
	}



	public void setCarmodel(String carmodel) {
		this.carmodel = carmodel;
	}



	public double getRentprice() {
		return rentprice;
	}



	public void setRentprice(double rentprice) {
		this.rentprice = rentprice;
	}



	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		
		
		
//		out.println("<div class='container' style='background-color:white; border:1px white solid; border-radius:25px; width:60%;'>");
//		out.println("<div class='row d-flex '>");
//		out.println("<div class='col-3'>");
//		out.println("<img src='"+imgPath+"' width='150' height='150' style='border-right:1px solid #ff9900;' />");
//		out.println("</div>");
//		out.println("<div class='col-9 d-flex row' >");
//		out.println("<div class='float-left'>");
//		out.println("<div>"+carname+"</div>");
//		out.println("<div>"+carmodel+"</div>");
//		out.println("</div>");
//		out.println("<div class='float-right'>"+rentprice+"</div>");
//		out.println("</div>");
//		out.println("");
//		out.println("");
//		out.println("</div>");
//		out.println("</div>");
		
		out.println("<div class='card row d-flex w-75 m-auto ' style='border-radius:25px; border:2px solid #ff9900; margin-bottom:20px !important;'>"
				+ "  <img src='"+imgPath+"' class='card-img-top col-md-5 w-25 h-auto' style='border-right:2px solid #ff9900; border-radius:25px;'/>"
				+ "  <div class='card-body col-md-7 text-black d-flex' style='justify-content:space-between;'>"
				+ "<div class='d-flex' style='justify-content:space-around;'>"
				+ "    <h5 class='card-title mr-3'>"+"Suzuki"+"</h5>"
				+ "    <h5 class='card-title mr-3'>"+carname+"</h5>"
				+ "    <p class='card-text mr-3'> "+carmodel+"</p>"
				+ "    <p class=\"card-text\"> "+rentprice+"</p>"
				+ "</div>"
				+ "<div>"
				+ "    <a href=\"#\" class='btn btn-warning float-right'>Select</a>\r\n"
				+ "</div>"
				+ "  </div>\r\n"
				+ "</div>");
	}
	
}
