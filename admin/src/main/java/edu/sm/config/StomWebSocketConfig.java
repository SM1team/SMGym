package edu.sm.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@EnableWebSocketMessageBroker
@Configuration
public class StomWebSocketConfig implements WebSocketMessageBrokerConfigurer{
    //websocket 서버를 만드는곳.

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws").setAllowedOriginPatterns("*").withSockJS();//ws라는 이름이 websocket server의 이름.
        //모든 곳에서 접속이 가능하게 할것이다 -> *로 설정.
        //
        //registry.addEndpoint("/chbot").setAllowedOriginPatterns("*").withSockJS();
        registry.addEndpoint("/wss").setAllowedOriginPatterns("*").withSockJS();
        //amdin용 서버
        //websocket으로 연결된 상태에서 실시간으로 data를 쏠려고한다.
    }

    /* 어플리케이션 내부에서 사용할 path를 지정할 수 있음 */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/send","/broadcast");
        //나가는 쪽의 셋팅.
    }
}
