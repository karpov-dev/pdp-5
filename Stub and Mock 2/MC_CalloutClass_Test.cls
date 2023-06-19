@IsTest
private class MC_CalloutClass_Test {

    @IsTest
    private static void makeCallout_Test() {
        Test.setMock(HttpCalloutMock.class, new MC_CalloutClass_CalloutMock());

        HttpResponse response = MC_CalloutClass.makeCallout();

        Assert.areEqual(200, response.getStatusCode());
        Assert.areEqual('application/json', response.getHeader('Content-Type'));
        Assert.areEqual('{"example":"test"}', response.getBody());
    }

    @IsTest
    private static void makeCallout_StaticResource_Test() {
        StaticResourceCalloutMock staticResourceMock = new StaticResourceCalloutMock();
        staticResourceMock.setStatusCode(200);
        staticResourceMock.setHeader('Content-Type', 'application/json');
        staticResourceMock.setStaticResource('MC_CalloutClass_MockResponse');

        Test.setMock(HttpCalloutMock.class, staticResourceMock);

        HttpResponse response = MC_CalloutClass.makeCallout();

        Assert.areEqual(200, response.getStatusCode());
        Assert.areEqual('application/json', response.getHeader('Content-Type'));
        Assert.areEqual('{"example":"test"}', response.getBody());
    }

    @IsTest
    private static void makeCallout_MultiStaticResource_Test() {
        MultiStaticResourceCalloutMock multiStaticResourceMock = new MultiStaticResourceCalloutMock();
        multiStaticResourceMock.setStatusCode(200);
        multiStaticResourceMock.setHeader('Content-Type', 'application/json');

        multiStaticResourceMock.setStaticResource('https://example.com/example/test', 'MC_CalloutClass_MockResponse_1');
        multiStaticResourceMock.setStaticResource('https://example.com/example/test-2', 'MC_CalloutClass_MockResponse_2');

        HttpResponse response_1 = MC_CalloutClass.makeCallout();
        Assert.areEqual(200, response_1.getStatusCode());
        Assert.areEqual('application/json', response_1.getHeader('Content-Type'));
        Assert.areEqual('{"example":"response from first url"}', response_1.getBody());

        HttpResponse response_2 = MC_CalloutClass.makeSecondCallout();
        Assert.areEqual(200, response_2.getStatusCode());
        Assert.areEqual('application/json', response_2.getHeader('Content-Type'));
        Assert.areEqual('{"example":"response from second url"}', response_2.getBody());
    }

}