# AI Sports Analysis Tool 🏓

An AI-powered sports analysis tool that provides real-time feedback and statistics overlay on sports videos using computer vision and pose detection. Originally inspired by viral sports analysis demos, this tool tracks players and displays detailed analytics.

![Demo](https://github.com/user-attachments/assets/8d317156-f187-470c-8e26-5b7f7f60d6f2)

## Features

- **Real-time Player Tracking**: Uses MediaPipe pose detection to track player movements
- **Score Tracking**: Automatically updates and displays team scores
- **Shot Analysis**: Displays shot types and player actions with timing
- **Animated Feedback**: Color-coded visual feedback for point outcomes
- **Multiple Video Support**: Configure different video/analysis combinations
- **Professional Overlay**: Clean, broadcast-style graphics overlay

## Quick Start

### Prerequisites

- Python 3.8 or higher
- pip package manager

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/ai-sports-analysis.git
cd ai-sports-analysis
```

2. **Run the setup script**
```bash
python setup.py
```

Or install manually:
```bash
pip install -r requirements.txt
```

### Usage

1. **Prepare your files**
   - Add your video file to the project directory
   - Add the corresponding JSON analysis file (see format below)

2. **Configure the analysis**
   - Open `pickleball.py`
   - Update the `CONFIGS` dictionary with your files:
   ```python
   CONFIGS = {
       1: {
           'json_file': 'your_analysis.json',
           'video_file': 'your_video.mp4',
           'output_file': 'your_output.mp4'
       }
   }
   ```
   - Set `CURRENT_CONFIG = 1`

3. **Run the analysis**
```bash
python pickleball.py
```

## JSON Data Format

The magic happens in the JSON analysis file. Here's the required format:

```json
{
  "shots": [
    {
      "timestamp_of_outcome": "0:15",
      "shot_by_player": "Player 1",
      "shot_type": "Forehand Drive",
      "point_winner": "Foreground Team",
      "current_score": "1-0-1",
      "feedback": "Great shot placement! The forehand was executed with perfect timing and placement."
    }
  ]
}
```

### Field Descriptions

- `timestamp_of_outcome`: When the shot outcome occurs (format: "minutes:seconds")
- `shot_by_player`: Name of the player making the shot
- `shot_type`: Type of shot (e.g., "Forehand Drive", "Backhand Slice")
- `point_winner`: "Foreground Team" or "Far Side Team"
- `current_score`: Score in format "team1-team2-serving_team"
- `feedback`: Detailed analysis text to display

## Project Structure

```
ai-sports-analysis/
├── pickleball.py          # Main analysis script
├── ball.py               # Alternative ball tracking script
├── requirements.txt      # Python dependencies
├── setup.py             # Automated setup script
├── .gitignore           # Git ignore rules
├── README.md            # This file
├── *.json              # Analysis data files
└── sample_videos/      # Example video files (not in repo)
```

## Configuration Options

### Video Processing Settings

- `process_every_n_frames`: Controls processing frequency (default: every 3rd frame)
- `animation_duration`: Duration of point outcome animations (default: 1.5 seconds)
- `feedback_display_duration`: How long to show feedback text (default: 5 seconds)

### Display Customization

- Player name and arrow styling
- Score display position and colors
- Text font sizes and positioning
- Animation colors and timing

## Advanced Usage

### Real-time Analysis

To convert this into a real-time application:

1. **Frame Management**: Send frames to AI analysis at 1 FPS (Gemini Video limitation)
2. **API Integration**: Use Gemini API to return analysis content
3. **Live Rendering**: Stream the overlay in real-time

### Mobile App Development

This codebase is perfect for iOS/Android app development:
- Use the core analysis logic
- Implement camera capture
- Add real-time API calls
- Create mobile-optimized UI

## Dependencies

- **OpenCV**: Video processing and overlay graphics
- **MediaPipe**: Human pose detection and tracking
- **NumPy**: Numerical operations and array handling

## Performance Tips

- **Video Resolution**: Higher resolution videos provide better pose detection but slower processing
- **Processing Rate**: Adjust `process_every_n_frames` based on your hardware
- **Memory Usage**: Large videos are processed in memory - consider streaming for very long videos

## Troubleshooting

### Common Issues

1. **"Could not open video file"**
   - Check file path and format
   - Ensure video codec is supported by OpenCV

2. **"Error loading JSON file"**
   - Verify JSON syntax is valid
   - Check file path and permissions

3. **Poor pose detection**
   - Ensure good lighting in video
   - Check that players are clearly visible
   - Consider higher resolution source video

### Performance Issues

- Reduce video resolution for faster processing
- Increase `process_every_n_frames` value
- Ensure sufficient RAM for video processing

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- Original concept inspired by viral sports analysis demos
- Built with MediaPipe for pose detection
- OpenCV for video processing and graphics

## Support

If you encounter any issues or have questions:
1. Check the troubleshooting section above
2. Search existing GitHub issues
3. Create a new issue with detailed information

---

**Made with ❤️ for sports analysis and computer vision enthusiasts**