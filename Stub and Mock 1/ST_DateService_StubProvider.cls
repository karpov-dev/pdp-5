public class ST_DateService_StubProvider implements System.StubProvider {

    public Object handleMethodCall(Object stubbedObject, String stubbedMethod, Type returnType, List<Type> paramTypes, List<String> paramNames, List<Object> paramValues) {
        if (stubbedMethod == 'getYesterday') {
            return 'YESTERDAY';
        }

        if (stubbedMethod == 'getToday') {
            return 'TODAY';
        }

        if (stubbedMethod == 'getTomorrow') {
            return 'TOMORROW';
        }

        return 'NOT_FOUND';
    }

}