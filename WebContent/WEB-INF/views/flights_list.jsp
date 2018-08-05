<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.airline.models.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/jpaStyles.css"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flights List</title>
</head>
<body>
		<h1>List of Flights</h1>
		
		<table>
		<tr>
		<th>Id</th>
		<th>from</th>
		<th>To</th>
		<th>Time</th>
		<th>Price</th>
		<th>Airplane</th>
		<th>Seating</th>
		<th>Number of pilots</th>
		<th>Pilot Names</th>
		
		
		</tr>
		<%
		List<Flight> fList = (List<Flight>) request.getAttribute("flight_list");
		
		for(Integer i=0; i < fList.size(); i++) {
			
		
			
		
		 %>
		 <tr>
		 <td> <%=fList.get(i).getId() %></td>
		 <td> <%=fList.get(i).getFlightOrigin() %></td>
		 <td><%=fList.get(i).getFlightDestination() %></td>
		 <td><%=fList.get(i).getFlightTime() %></td>
		 <td><%=fList.get(i).getPrice() %></td>
		 
		 <td><%=fList.get(i).getAirplaneDetail().getPlaneMake() + " " + fList.get(i).getAirplaneDetail().getModelName() %></td>
		 <td><%=fList.get(i).getAirplaneDetail().getSeatingCapacity() %></td>
		 
		 <td>
		 	<%
		 		if(fList.get(i).getPilots() != null) {
		 		
		 	
		 	 %>
		 	 	<%=fList.get(i).getPilots().size() %> pilots
		 	 <%
		 	 }
		 	 	else {
		 	 	
		 	  %>
		 	  	No Pilots Yet
		 	  <%
		 	  }
		 	   %>
		 
		 </td>
		 <td>
		 
		 
		
		 <%
		 		if(fList.get(i).getPilots() != null) {
		 		List<Pilot> pList = (List<Pilot>) fList.get(i).getPilots();
		 		
		 		for(Integer j = 0; j < pList.size(); j++) {
		 		
		 	
		 	 %>
		 	 
		 	 	<%= (j+1) + ") " + pList.get(j).getFirstName() + " " + pList.get(j).getLastName()
		 	 	+ " (" + pList.get(j).getPilotRank() + ")" + "<br />"
		 	 	 %>
		 	 
		 	 <%
		 	 }//for
		 	 }//if
		 	  %>
		 	  </td>
		 
		 </tr>
		 
		 <tr>
		 
		 <td colspan="8">No Passengers on this flight yet.</td>
		 </tr>
		 
		<%
			}
		 %>
		
		
		</table>


</body>
</html>