//
//  GstPlayerWrapper.c
//  AudioPlayer
//
//  Created by Stephan on 26.06.18.
//  Copyright © 2018 Blinkist. All rights reserved.
//

#include <gst/player/player.h>

#include "GstPlayerWrapper.h"

gpointer GstInit(gpointer data) {
    gst_init(NULL, NULL);
    return NULL;
}
    
void GstPlayerInit() {
    gst_init(NULL, NULL);
}

void* GstPlayerCreate(void
                      positionCallback (void *player,
                                        long arg1,
                                        void *data), void* userData) {
    //static GOnce gst_init_once = G_ONCE_INIT;
    //g_once (&gst_init_once, GstInit, NULL);
    
    GstPlayer* player = gst_player_new(NULL, NULL);
    
    g_signal_connect(player, "position-updated", G_CALLBACK(positionCallback), userData);
    
    return player;
}

void GstPlayerSetUri(void* player, const char *uri) {
    gst_player_set_uri(player, uri);
}

void GstPlayerPlay(void* player) {
    gst_player_play(player);
}

void GstPlayerSeek(void* player, int milliseconds) {
    gst_player_seek(player, GST_MSECOND * milliseconds);
}


