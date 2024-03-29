#define MAILBOX_BASE	(MMIO_VA+0x00B880)

#define MPI_REQUEST 		0x00000000
#define MPI_RESPONSE_OK		0x80000000
#define MPI_RESPONSE_ERR	0x80000001

#define POS_OVERALL_LENGTH	0
#define POS_RV			1
#define POS_TAG			2

#define POS_TAG_ID		0
#define POS_TAG_BUFLEN		1
#define POS_TAG_DATALEN		2
#define POS_TAG_DATA		3


#define MB_HEADER_LENGTH 2
#define TAG_HEADER_LENGTH 3

/* to be extended */
#define MPI_TAG_GET_FIRMWARE		0x00000001
#define MPI_TAG_GET_BOARD_MODEL		0x00010001
#define MPI_TAG_GET_BOARD_REVISION	0x00010002
#define MPI_TAG_GET_MAC_ADDRESS		0x00010003
#define MPI_TAG_GET_BOARD_SERIAL	0x00010004
#define MPI_TAG_GET_ARM_MEMORY		0x00010005
#define MPI_TAG_GET_VC_MEMORY		0x00010006
#define MPI_TAG_GET_CLOCKS		0x00010007
#define MPI_TAG_GET_COMMANDLINE		0x00050001
#define MPI_TAG_GET_DMA_CHANNELS	0x00060001
#define MPI_TAG_GET_POWER_STATE		0x00020001
#define MPI_TAG_SET_POWER_STATE		0x00028001
#define MPI_TAG_GET_TIMING		0x00020002
#define MPI_TAG_GET_FIRMWARE		0x00000001
#define MPI_TAG_GET_CLOCK_STATE		0x00030001
#define MPI_TAG_SET_CLOCK_STATE		0x00038001

/** 
	property tags
*/

#define	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =                   0x00040001
#define RPI_FIRMWARE_FRAMEBUFFER_BLANK =                      0x00040002
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_PHYSICAL_WIDTH_HEIGHT =  0x00040003
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_VIRTUAL_WIDTH_HEIGHT =   0x00040004
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_DEPTH =                  0x00040005
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_PIXEL_ORDER =            0x00040006
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_ALPHA_MODE =             0x00040007
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_PITCH =                  0x00040008
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_VIRTUAL_OFFSET =         0x00040009
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_OVERSCAN =               0x0004000a
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_PALETTE =                0x0004000b
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_TOUCHBUF =               0x0004000f
#define	RPI_FIRMWARE_FRAMEBUFFER_GET_GPIOVIRTBUF =            0x00040010
#define	RPI_FIRMWARE_FRAMEBUFFER_RELEASE =                    0x00048001

void fbstatus(void);
