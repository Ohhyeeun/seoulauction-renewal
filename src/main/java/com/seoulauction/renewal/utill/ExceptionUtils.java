package com.seoulauction.renewal.utill;

public class ExceptionUtils {

    public static String getStackTrace(Throwable e){

        StringBuilder builder = new StringBuilder();
        builder.append("EXCEPTION NAME : " + e + "\n");

        StackTraceElement[] stackTraceElements = e.getStackTrace();
        if(stackTraceElements.length != 0) {
            builder.append("====================STACK TRACE====================\n");
            for (StackTraceElement stackTraceElement : stackTraceElements) {
                builder.append("CLASS : " + stackTraceElement.getClassName() + " / ");
                builder.append("LINE : [" + stackTraceElement.getLineNumber() + "]\n");
            }
        }

        return builder.toString();
    }
}
