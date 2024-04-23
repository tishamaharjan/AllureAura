export const TextInput = ({
	onTextChange,
	placeholder,
	type,
	value,
	inputStyle,
	showError
}) => {

	const inputStyles = {
    ...styles.input,
    ...(showError && value.trim() === '' ? styles.errorOutline : {}),
    ...inputStyle,
  };

	return (
		<div style={{ display: "flex", flex: 1 }}>
			<input
				type={type}
				placeholder={placeholder}
				style={inputStyles}
				onChange={(e) => onTextChange(e.target.value)}
				value={value}
			/>
		</div>
	);
};

const styles = {
	input: {
		marginBottom: 25,
		padding: 10,
		fontSize: 18,
		borderRadius: 13,
		width: "100%",
		backgroundColor: "transparent",
		border: "1px solid #7BD3EA",
		textAlign: "center",
		outline: "none",
	},

	errorOutline: {
		border: "3px solid red",
	}
};

