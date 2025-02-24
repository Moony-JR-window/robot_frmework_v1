*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}      http://localhost:4723/wd/hub
${DEVICE_NAME}     Pixel_9_Pro_API_35
${PLATFORM_NAME}   Android
${APP_PACKAGE}     com.wingmoney.wingpay.uat
${APP_ACTIVITY}    com.wingmoney.wingpay.ui.SplashActivity
${NO_RESET}        ${TRUE}
${DONT_STOP_APP}   ${TRUE}

*** Test Cases ***
Launch WingPay App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=${NO_RESET}
    ...    dontStopAppOnReset=${DONT_STOP_APP}    # ✅ Keeps app running in the background
    ...    autoGrantPermissions=${TRUE}    # ✅ Ensures permissions are granted
    Wait Until Element Is Visible    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View[4]/android.widget.Button    10s
    Click Element       //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View[4]/android.widget.Button
    Wait Until Element Is Visible     //android.widget.EditText
    Input Text          //android.widget.EditText    086938457   
    Wait Until Element Is Visible     //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button  10s
    Click Element       //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button
    Wait Until Element Is Visible    //android.widget.EditText   10s
    Input Text          //android.widget.EditText   123456

    Sleep    5s
    Capture Page Screenshot
    Close Application

    