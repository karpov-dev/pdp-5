@IsTest
public class MC_CalloutClass_CalloutMock implements HttpCalloutMock {

    public HttpResponse respond(HttpRequest request) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example":"test"}');
        res.setStatusCode(200);

        return res;
    }

}