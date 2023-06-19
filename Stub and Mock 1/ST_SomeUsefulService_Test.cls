@IsTest
private class ST_SomeUsefulService_Test {

    @IsTest
    private static void someUsefulMethod_Test() {
        ST_SomeUsefulService service = new ST_SomeUsefulService(getDateServiceStub());
        service.someUsefulMethod();
    }

    private static ST_DateService getDateServiceStub() {
        return (ST_DateService) Test.createStub(ST_DateService.class, new ST_DateService_StubProvider());
    }

}