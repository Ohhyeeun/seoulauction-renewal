package com.seoulauction.renewal.utill;

import com.slack.api.Slack;
import com.slack.api.methods.MethodsClient;
import com.slack.api.methods.SlackApiException;
import com.slack.api.methods.request.chat.ChatGetPermalinkRequest;
import com.slack.api.methods.request.chat.ChatPostMessageRequest;
import com.slack.api.methods.response.chat.ChatGetPermalinkResponse;
import com.slack.api.methods.response.chat.ChatPostMessageResponse;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.concurrent.ArrayBlockingQueue;

@Component
@Log4j2
public class SlackSender {

    @Value("${slack.use}")
    Boolean use;

    @Value("${slack.token}")
    String token;
    @Value("${slack.channel.error.monitoring}")
    String channel;

    Boolean startingQueue;

    Integer CAPACITY = 10;

    Integer SLACK_MESSAGE_DELAY = 2 * 1000;

    ArrayBlockingQueue<String> slackBlockingQueue = new ArrayBlockingQueue<>(CAPACITY);

    @PostConstruct
    public void init(){
        log.info("slackSender init");
        startingQueue = true;
        slackBlockingQueue = new ArrayBlockingQueue<>(CAPACITY);
        startingQueue();
    }

    public synchronized void sendMessage(String message){
        try {
            if(slackBlockingQueue.size() < CAPACITY) {
                log.info("slackSender save!!!!");
                log.info("slackSender : {}" , slackBlockingQueue.size());
                slackBlockingQueue.put(message);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void startingQueue(){

        if(!use){
            log.info("slack not using!!");
            return;
        }
        if(startingQueue) {
            new Thread(() -> {
                    try {
                        while(true) {
                            String meessage = slackBlockingQueue.take();

                            MethodsClient methods = Slack.getInstance().methods(token);

                            ChatPostMessageRequest request = ChatPostMessageRequest.builder()
                                    .channel(channel)
                                    .text(meessage)
                                    .build();

                            methods.chatPostMessage(request);
                            log.info("success send message");
                            Thread.sleep(SLACK_MESSAGE_DELAY);
                        }
                    } catch (SlackApiException | IOException | InterruptedException e) {
                        log.error(e.getMessage());
                        startingQueue = false;
                    }
            }).start();

        }


    }
}
