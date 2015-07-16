package json;

/**
 * Created by ASUS on 7/16/2015.
 */
public class ResponseJSON {
    private boolean success;
    private Object errorCodes;

    public ResponseJSON() {
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getErrorCodes() {
        return errorCodes;
    }

    public void setErrorCodes(Object errorCodes) {
        this.errorCodes = errorCodes;
    }
}
