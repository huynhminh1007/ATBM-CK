package Services;

import Database.LogDAO;

public class LogServiceManager {
    private static final ILogService logService;

    static {
        logService = new LogService(new LogDAO());
    }

    public static ILogService getLogService() {
        return logService;
    }
}
