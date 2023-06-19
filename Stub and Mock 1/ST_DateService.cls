public class ST_DateService {

    public String getToday() {
        return Date.today().format();
    }

    public String getYesterday() {
        return Date.today().addDays(-1).format();
    }

    public String getTomorrow() {
        return Date.today().addDays(1).format();
    }

}