package app.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import app.controller.CarController;
import app.model.Cars;

@WebServlet("/EditCar")
public class EditCar extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String carno=request.getParameter("car_no");
		String carname=request.getParameter("car_name");
		String carmaker=request.getParameter("car_maker");
		String carmodel=request.getParameter("car_model");
		String availability=request.getParameter("availability");
		String carid = (String) session.getAttribute("id");
		System.out.println(carid);
		Part imgPart = request.getPart("car_photo");
		double rent_price= Double.parseDouble(request.getParameter("rent_price"));
		
		Cars car = new Cars();
		car.setCar_id(Integer.parseInt(carid));
		car.setCar_no(carno);
		car.setCar_name(carname);
		car.setCar_maker(carmaker);
		car.setCar_model(carmodel);
		car.setRent_price(rent_price);
		car.setCarAvailable(availability);
		int status = 0;
		try {
			status = CarController.updateCar(car, imgPart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(status>0) {
			out.println("<script type='text/javascript'>");
			out.println("alert('Car Updated Successfully');");
			out.println("</script>");
			session.setAttribute("id","");
			response.sendRedirect("viewcars.jsp");
		}else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Car Not Registered Successfully');");
			out.println("</script>");
			
			request.getRequestDispatcher("viewcars.jsp").include(request, response);
		}
	}

}
