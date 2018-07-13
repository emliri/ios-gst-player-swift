#import <gst/player/player.h>
#import <AudioPlayer/AudioPlayer-Swift.h>
#import "Gstreamer.h"
#import "GstreamerConfiguration.h"

@interface Gstreamer () <ProviderProtocol> @end

@implementation Gstreamer {
    GstPlayer *player;
    id<ProviderDelegate> delegate;
}

static Gstreamer *monostate;
@synthesize delegate;

-(instancetype)init {
    self = [super init];
    monostate = self;
    GstreamerConfiguration();
    
    gst_debug_set_threshold_for_name("gst-player", GST_LEVEL_ERROR);
    player = gst_player_new(NULL, NULL);
    g_signal_connect(player, "position-updated", G_CALLBACK(positionCallback), NULL);
    
    return self;
}

-(void)play {
    gst_player_play(player);
}

-(void)setWithUri:(NSString * _Nonnull)uri {
    gst_player_set_uri(player, [uri cStringUsingEncoding:NSASCIIStringEncoding]);
}

void positionCallback(void *player, long time, void *data) {
    [[monostate delegate] positionCallbackWithTime:time];
}

@end
