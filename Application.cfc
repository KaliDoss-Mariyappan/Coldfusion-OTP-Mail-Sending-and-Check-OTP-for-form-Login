component {
    this.name = 'my-email-otp-application12';   
    this.sessionmanagement = true;
    this.sessiontimeout = createTimespan(0,0,10,0);
    public function onRequestStart() {
        application.loginObject = createObject('component', 'com.db.login');
    }
}