public class MC_CalloutClass {

    public static HttpResponse makeCallout() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://example.com/example/test');
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(request);

        return res;
    }

    public static HttpResponse makeSecondCallout() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://example.com/example/test-2');
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(request);

        return res;
    }

}