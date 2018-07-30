#import <gst/player/player.h>
#import <AudioPlayer/AudioPlayer-Swift.h>
#import "Gstreamer.h"
#import "GstreamerConfiguration.h"

@interface Gstreamer () <ProviderProtocol> @end

@implementation Gstreamer

static GstPlayer *player;
static id<ProviderDelegate> delegate;
@synthesize delegate;

-(instancetype)init {
    self = [super init];
    if (!player) {
        [self configurePlayer];
    }
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

-(void)stop {
    gst_player_stop(player);
}

-(void)seekWithSeconds:(long)seconds {
    gst_player_seek(player, seconds);
}

-(void)configurePlayer {
    GstreamerConfiguration();
    gst_debug_set_threshold_for_name(kGstPlayer, GST_LEVEL_ERROR);
    player = gst_player_new(NULL, NULL);
    [self configureCallBacks];
}

-(void)configureCallBacks {
    g_signal_connect(player, kPositionUpdated, G_CALLBACK(positionCallback), NULL);
    g_signal_connect(player, kDurationChanged, G_CALLBACK(durationCallback), NULL);
    g_signal_connect(player, kError, G_CALLBACK(errorCallback), NULL);
}

void positionCallback(void *player, long time, void *data) {
    [delegate positionCallbackWithTime:time];
}

void durationCallback(void *player, long time, void *data) {
    [delegate durationCallbackWithTime:time];
}

void errorCallback(void *player, GError *error, void *data) {
    [delegate foundErrorWithMessage:[[NSString alloc] initWithUTF8String:error->message] code:(long)(error->code)];
}

static char *const kGstPlayer = "gst-player";
static char *const kPositionUpdated = "position-updated";
static char *const kDurationChanged = "duration-changed";
static char *const kError = "error";

@end
