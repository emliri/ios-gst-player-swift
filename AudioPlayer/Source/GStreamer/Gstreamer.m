#import <gst/player/player.h>
#import <AudioPlayer/AudioPlayer-Swift.h>
#import "Gstreamer.h"
#import "GstreamerConfiguration.h"

@interface Gstreamer () <PlayerProviderProtocol> @end

@implementation Gstreamer {
    GstPlayer *player;
}

-(instancetype)init {
    self = [super init];
    GstreamerConfiguration();
    
    gst_debug_set_threshold_for_name("gst-player", GST_LEVEL_TRACE);
    player = gst_player_new(NULL, NULL);
    g_signal_connect(player, "position-updated", G_CALLBACK(positionCallback), NULL);
    
    return self;
}

void positionCallback(void *player,
      long arg1,
      void *data) {
    NSLog(@"time:::: ");
}

-(void)play {
    gst_player_play(player);
}

- (void)setWithUri:(NSString * _Nonnull)uri {
    gst_player_set_uri(player, [uri cStringUsingEncoding:NSASCIIStringEncoding]);
}

@end
