//
//  GstPlayerWrapper.c
//  AudioPlayer
//
//  Created by Stephan on 26.06.18.
//  Copyright © 2018 Blinkist. All rights reserved.
//

#include <gst/player/player.h>

#include "GstPlayerWrapper.h"

void InitGStreamer() {
    gst_init(NULL, NULL);
}

void* CreateGstPlayer() {
    static GOnce gst_init_once = G_ONCE_INIT;
    g_once (&gst_init_once, InitGStreamer, NULL);

    return gst_player_new(NULL, NULL);
}
