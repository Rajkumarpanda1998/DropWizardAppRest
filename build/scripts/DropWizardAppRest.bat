@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  DropWizardAppRest startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and DROP_WIZARD_APP_REST_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\DropWizardAppRest-1.0-SNAPSHOT.jar;%APP_HOME%\lib\dropwizard-hibernate-2.0.10.jar;%APP_HOME%\lib\dropwizard-core-2.0.10.jar;%APP_HOME%\lib\dropwizard-db-2.0.10.jar;%APP_HOME%\lib\dropwizard-jersey-2.0.10.jar;%APP_HOME%\lib\dropwizard-jetty-2.0.10.jar;%APP_HOME%\lib\dropwizard-request-logging-2.0.10.jar;%APP_HOME%\lib\dropwizard-logging-2.0.10.jar;%APP_HOME%\lib\dropwizard-configuration-2.0.10.jar;%APP_HOME%\lib\dropwizard-metrics-2.0.10.jar;%APP_HOME%\lib\dropwizard-jackson-2.0.10.jar;%APP_HOME%\lib\mysql-connector-j-8.0.31.jar;%APP_HOME%\lib\dropwizard-lifecycle-2.0.10.jar;%APP_HOME%\lib\dropwizard-validation-2.0.10.jar;%APP_HOME%\lib\dropwizard-servlets-2.0.10.jar;%APP_HOME%\lib\dropwizard-util-2.0.10.jar;%APP_HOME%\lib\metrics-jetty9-4.1.9.jar;%APP_HOME%\lib\metrics-servlets-4.1.9.jar;%APP_HOME%\lib\metrics-jvm-4.1.9.jar;%APP_HOME%\lib\metrics-jmx-4.1.9.jar;%APP_HOME%\lib\metrics-jersey2-4.1.9.jar;%APP_HOME%\lib\metrics-logback-4.1.9.jar;%APP_HOME%\lib\metrics-json-4.1.9.jar;%APP_HOME%\lib\metrics-core-4.1.9.jar;%APP_HOME%\lib\metrics-healthchecks-4.1.9.jar;%APP_HOME%\lib\argparse4j-0.8.1.jar;%APP_HOME%\lib\jetty-setuid-java-1.0.4.jar;%APP_HOME%\lib\jackson-datatype-guava-2.10.4.jar;%APP_HOME%\lib\guava-28.2-jre.jar;%APP_HOME%\lib\caffeine-2.8.4.jar;%APP_HOME%\lib\jackson-datatype-hibernate5-2.10.4.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.10.4.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.10.4.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.10.4.jar;%APP_HOME%\lib\jackson-module-afterburner-2.10.4.jar;%APP_HOME%\lib\jackson-datatype-joda-2.10.4.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.10.4.jar;%APP_HOME%\lib\jackson-jaxrs-json-provider-2.10.4.jar;%APP_HOME%\lib\jackson-jaxrs-base-2.10.4.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.10.4.jar;%APP_HOME%\lib\jackson-databind-2.10.4.jar;%APP_HOME%\lib\jackson-core-2.10.4.jar;%APP_HOME%\lib\jackson-annotations-2.10.4.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.30.jar;%APP_HOME%\lib\log4j-over-slf4j-1.7.30.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.30.jar;%APP_HOME%\lib\metrics-annotation-4.1.9.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\jersey-bean-validation-2.31.jar;%APP_HOME%\lib\jersey-container-servlet-2.31.jar;%APP_HOME%\lib\jersey-container-servlet-core-2.31.jar;%APP_HOME%\lib\jersey-server-2.31.jar;%APP_HOME%\lib\jersey-client-2.31.jar;%APP_HOME%\lib\jersey-metainf-services-2.31.jar;%APP_HOME%\lib\jersey-hk2-2.31.jar;%APP_HOME%\lib\jersey-media-jaxb-2.31.jar;%APP_HOME%\lib\jersey-common-2.31.jar;%APP_HOME%\lib\jakarta.ws.rs-api-2.1.6.jar;%APP_HOME%\lib\hibernate-core-5.4.16.Final.jar;%APP_HOME%\lib\javax.persistence-api-2.2.jar;%APP_HOME%\lib\joda-time-2.10.6.jar;%APP_HOME%\lib\tomcat-jdbc-9.0.35.jar;%APP_HOME%\lib\javassist-3.27.0-GA.jar;%APP_HOME%\lib\usertype.core-7.0.0.CR1.jar;%APP_HOME%\lib\jakarta.xml.bind-api-2.3.3.jar;%APP_HOME%\lib\jakarta.activation-api-1.2.2.jar;%APP_HOME%\lib\protobuf-java-3.19.4.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\jakarta.servlet-api-4.0.3.jar;%APP_HOME%\lib\hibernate-validator-6.1.5.Final.jar;%APP_HOME%\lib\jakarta.validation-api-2.0.2.jar;%APP_HOME%\lib\jetty-servlet-9.4.29.v20200521.jar;%APP_HOME%\lib\jetty-security-9.4.29.v20200521.jar;%APP_HOME%\lib\jetty-server-9.4.29.v20200521.jar;%APP_HOME%\lib\jetty-servlets-9.4.29.v20200521.jar;%APP_HOME%\lib\jetty-http-9.4.29.v20200521.jar;%APP_HOME%\lib\jetty-io-9.4.29.v20200521.jar;%APP_HOME%\lib\jetty-util-9.4.29.v20200521.jar;%APP_HOME%\lib\hk2-locator-2.6.1.jar;%APP_HOME%\lib\hk2-api-2.6.1.jar;%APP_HOME%\lib\hk2-utils-2.6.1.jar;%APP_HOME%\lib\jakarta.inject-2.6.1.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\commons-text-1.8.jar;%APP_HOME%\lib\commons-lang3-3.10.jar;%APP_HOME%\lib\logback-access-1.2.3.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\logback-throttling-appender-1.1.0.jar;%APP_HOME%\lib\javax.transaction-api-1.3.jar;%APP_HOME%\lib\tomcat-juli-9.0.35.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.3.jar;%APP_HOME%\lib\usertype.spi-7.0.0.CR1.jar;%APP_HOME%\lib\hibernate-commons-annotations-5.1.0.Final.jar;%APP_HOME%\lib\jboss-logging-3.3.2.Final.jar;%APP_HOME%\lib\byte-buddy-1.10.10.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\jboss-transaction-api_1.2_spec-1.1.1.Final.jar;%APP_HOME%\lib\jandex-2.1.3.Final.jar;%APP_HOME%\lib\dom4j-2.1.3.jar;%APP_HOME%\lib\jaxb-runtime-2.3.1.jar;%APP_HOME%\lib\jakarta.el-3.0.3.jar;%APP_HOME%\lib\profiler-1.1.1.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\checker-qual-3.4.0.jar;%APP_HOME%\lib\error_prone_annotations-2.3.4.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\aopalliance-repackaged-2.6.1.jar;%APP_HOME%\lib\txw2-2.3.1.jar;%APP_HOME%\lib\istack-commons-runtime-3.0.7.jar;%APP_HOME%\lib\stax-ex-1.8.jar;%APP_HOME%\lib\FastInfoset-1.2.15.jar;%APP_HOME%\lib\snakeyaml-1.26.jar;%APP_HOME%\lib\jetty-continuation-9.4.29.v20200521.jar


@rem Execute DropWizardAppRest
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %DROP_WIZARD_APP_REST_OPTS%  -classpath "%CLASSPATH%" com.app.DemoApplication %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable DROP_WIZARD_APP_REST_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%DROP_WIZARD_APP_REST_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
