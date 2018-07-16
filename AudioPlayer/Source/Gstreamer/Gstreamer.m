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
    [self configureGStreamer];
    return self;
}

-(void)play {
    gst_player_play(player);
}

-(void)pause {
    gst_player_pause(player);
}

-(void)setSourceWithUrl:(NSString * _Nonnull)url {
    gst_player_set_uri(player, [url cStringUsingEncoding:NSASCIIStringEncoding]);
}

-(void)removeSource {
    gst_player_set_uri(player, NULL);
}

-(void)configureGStreamer {
    gst_debug_set_threshold_for_name("gst-player", GST_LEVEL_ERROR);
    player = gst_player_new(NULL, NULL);
    [self configureCallBacks];
}

-(void)configureCallBacks {
    g_signal_connect(player, "position-updated", G_CALLBACK(positionCallback), NULL);
    g_signal_connect(player, "duration-changed", G_CALLBACK(durationCallback), NULL);
}

void positionCallback(void *player, long time, void *data) {
    [[monostate delegate] positionCallbackWithTime:time];
}

void durationCallback(void *player, long time, void *data) {
    [[monostate delegate] durationCallbackWithTime:time];
}

@end
