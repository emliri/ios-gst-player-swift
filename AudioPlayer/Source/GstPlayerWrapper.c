//
//  GstPlayerWrapper.c
//  AudioPlayer
//
//  Created by Stephan on 26.06.18.
//  Copyright © 2018 Blinkist. All rights reserved.
//

#include <gst/player/player.h>

#include "GstPlayerWrapper.h"

void* CreateGstPlayer() {
    gst_init(NULL, NULL);
    return gst_player_new(NULL, NULL);
}
