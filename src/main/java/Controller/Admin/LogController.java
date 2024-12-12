package Controller.Admin;

import Model.Log;
import Services.*;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import static Services.LogServiceManager.getLogService;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/admin/LogController")
public class LogController extends HttpServlet {

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "get";
        switch (action) {
            case "get" -> get(request, response);
            case "getFilter" -> getFilter(request, response);
            case "remove" -> remove(request, response);
            default -> throw new IllegalArgumentException("Unexpected value: " + action);
        }

    }

    private void remove(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("logId"));
        LogServiceManager.getLogService().deleteLogById(id);
    }

    protected void getFilter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String levels = request.getParameter("levels");
        response.setContentType("application/json");
        List<Log> filteredLogs = LogServiceManager.getLogService().findAllLogs();
        if (!levels.isEmpty()) {
            List<String> levelList = Arrays.asList(levels.split(","));
            filteredLogs = LogServiceManager.getLogService().filterLogs(levelList.stream().map(Integer::parseInt)
                    .toList());
        }
        String json = new Gson().toJson(filteredLogs);
        response.getWriter().write(json);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void get(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Log> logs = getLogService().findAllLogs();
        request.setAttribute("logs", logs);
        request.getRequestDispatcher("/admin/logs-data-table.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
