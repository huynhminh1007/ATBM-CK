package Utils;

import java.util.List;

public class StatisticsResponse {
    private List<Integer> months;
    private List<Double> revenues;

    public StatisticsResponse(List<Integer> months, List<Double> revenues) {
        this.months = months;
        this.revenues = revenues;
    }

    public List<Integer> getMonths() {
        return months;
    }

    public void setMonths(List<Integer> months) {
        this.months = months;
    }

    public List<Double> getRevenues() {
        return revenues;
    }

    public void setRevenues(List<Double> revenues) {
        this.revenues = revenues;
    }
}
