public class ST_SomeUsefulService {

    private final ST_DateService dateService;

    public ST_SomeUsefulService() {
        dateService = new ST_DateService();
    }

    public ST_SomeUsefulService(ST_DateService dateService) {
        this.dateService = dateService;
    }

    public void someUsefulMethod() {
        System.debug(dateService.getYesterday());
        System.debug(dateService.getToday());
        //System.debug(dateService.getTomorrow());
    }

}