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

import java.io.IOException;

@Component
@Log4j2
public class SlackSender {

    @Value("${slack.token}")
    String token;
    @Value("${slack.channel.error.monitoring}")
    String channel;

    public void postSlackMessage(String message){
        try{
            MethodsClient methods = Slack.getInstance().methods(token);

            ChatPostMessageRequest request = ChatPostMessageRequest.builder()
                    .channel(channel)
                    .text(message)
                    .build();

            methods.chatPostMessage(request);
            log.info("success send message");
        } catch (SlackApiException | IOException e) {
            log.error(e.getMessage());
        }
    }
}
