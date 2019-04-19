/*
 * Copyright 2012 The Netty Project
 *
 * The Netty Project licenses this file to you under the Apache License,
 * version 2.0 (the "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at:
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */
package com.vshow.control.tool;

import org.apache.tools.ant.taskdefs.Sleep;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;

import io.netty.handler.codec.LengthFieldBasedFrameDecoder;
import io.netty.handler.codec.LengthFieldPrepender;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import io.netty.handler.ssl.SslContext;
import io.netty.handler.ssl.SslContextBuilder;
import io.netty.handler.ssl.util.SelfSignedCertificate;
import io.netty.util.CharsetUtil;



/**
 * Echoes back any received data from a client.
 */
  class VSEchoServerCls {

    static final boolean SSL = System.getProperty("ssl") != null;
   
    public static boolean flag=true;
    public  void do_start(int port) throws Exception {
    	// System.out.println("do_start..1");
        // Configure SSL.
        final SslContext sslCtx;
        if (SSL) {
            SelfSignedCertificate ssc = new SelfSignedCertificate();
            sslCtx = SslContextBuilder.forServer(ssc.certificate(), ssc.privateKey()).build();
        } else {
            sslCtx = null;
        }
        //System.out.println("do_start..2");
        // Configure the server.
        EventLoopGroup bossGroup = new NioEventLoopGroup(1);
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        try {
            ServerBootstrap b = new ServerBootstrap();
            b.group(bossGroup, workerGroup)
             .channel(NioServerSocketChannel.class)
             .option(ChannelOption.SO_BACKLOG, 100)
              .handler(new LoggingHandler(LogLevel.INFO)).childHandler(new VSServerInitializer());
             /**.childHandler(new ChannelInitializer<SocketChannel>() {  
                 @Override  
                 public void initChannel(SocketChannel ch) throws Exception {  
                     ChannelPipeline pipeline = ch.pipeline();  
                     pipeline.addLast("frameDecoder", new LengthFieldBasedFrameDecoder(Integer.MAX_VALUE, 0, 4, 0, 4));  
                     pipeline.addLast("frameEncoder", new LengthFieldPrepender(4));  
                     pipeline.addLast("decoder", new StringDecoder(CharsetUtil.UTF_8));  
                     pipeline.addLast("encoder", new StringEncoder(CharsetUtil.UTF_8));  
                     pipeline.addLast(new VSServerInitializer());  
                 }  
             });**/  
          

            // Start the server.
            ChannelFuture f = b.bind(port).sync();
            
            // Wait until the server socket is closed.
            while(Constant.MTFLAG){
            	Thread.sleep(1000);
            }
            //f.channel().closeFuture().sync();
            
        } finally {
            // Shut down all event loops to terminate all threads.
        
            bossGroup.shutdownGracefully();
            workerGroup.shutdownGracefully();
        }
    }
   
}
